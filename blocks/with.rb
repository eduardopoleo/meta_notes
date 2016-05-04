module Kernel
  def with(resource)
    begin
      yield
    ensure #ensures that this code always runs no matter what
      resource.dispose
    end
  end
end
