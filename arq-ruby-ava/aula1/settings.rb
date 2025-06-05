class Settings
  attr_accessor :configurações

  def initialize
    @configurações = {}
  end

  def add(attribute, value, aliass: nil, readonly: false)
    eval("@#{attribute} = value")
    eval("@configurações[:#{attribute}] = value")

    self.class.public_send(:define_method, attribute) do
      eval("@#{attribute}")
    end

    unless readonly
      self.class.public_send(:define_method, "#{attribute}=") do |new_value|
        eval("@#{attribute} = new_value")
        eval("@configurações[:#{attribute}] = new_value")
      end
    end

    if aliass
      self.class.alias_method aliass, attribute
      self.class.alias_method "#{aliass}=", "#{attribute}=" unless readonly
    end
  end

  def all
    @configurações
  end

  def method_missing(method_name, *args, &block)
    if method_name.to_s.end_with?('=') && self.methods.any? { _1.to_s == method_name.to_s.gsub('=','') }
      puts "Essa configuração é somente para leitura: '#{method_name}'"
    else
      puts "Configuração '#{method_name}' não existe."
    end
  end
end