module Ultimaversion

using Genie, Logging, LoggingExtras

function main()
  Base.eval(Main, :(const UserApp = Ultimaversion))

  Genie.genie(; context = @__MODULE__)

  Base.eval(Main, :(const Genie = Ultimaversion.Genie))
  Base.eval(Main, :(using Genie))
end

end
