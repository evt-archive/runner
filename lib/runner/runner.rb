class Runner
  dependency :logger

  attr_reader :files

  def initialize(files)
    @files = files
  end

  def self.build(files)
    new(files).tap do |instance|
      logger.configure instance
    end
  end

  def self.!(*args, &reject_blk)
    logger = Logger.get self

    base_dir = File.expand_path(File.dirname(caller[0]))
    patterns = file_patterns(args)
    files = glob(patterns, base_dir)

    if block_given?
      files.reject! &reject_blk
    end

    if files.empty?
      logger.error "No files found for file patterns: #{patterns.join(', ')}"
      return failure_code
    end

    instance = new files
    instance.!
  end

  def self.glob(patterns, base_dir)
    files = []
    patterns.each do |pattern|
      pattern = Pathname.new(pattern).absolute? ? pattern : File.join(base_dir, pattern)
      files.concat Dir.glob(pattern)
    end
    files
  end

  def self.file_patterns(args)
    patterns = []
    args.each do |pattern|
      patterns.concat pattern.is_a?(Array) ? pattern : [pattern]
    end
    patterns
  end

  def !
    files.each do |file|
      load file
    end

    return self.class.success_code
  end

  def self.failure_code
    1
  end

  def self.success_code
    0
  end
end
