class Shift

  attr_reader :keys, :offsets, :shifts

  def initialize(text, key, date)
    @text = text
    @key = Keys.new(@key)
    @date = Offset.new(@date)
    @keys ||= generate_keys
    @offsets ||= generate_offsets
    @alphabet = alphabet
    @shift = calculate_shift
  end
end 
