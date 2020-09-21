module Listable

  def splitter(object)
    object.split('')
  end

  def get_alphabet
    ('a'..'z').to_a << ' '
  end

  def get_shifts
    ('a'..'d')
  end

end
