$PUTS=[]

$:<<File.expand_path(File.dirname(__FILE__))


module Kernel
  alias_method :old_puts, :puts
  def puts(s)
    $PUTS<<s
  end
end

require_relative('redflag.rb')

$:.pop

puts $PUTS