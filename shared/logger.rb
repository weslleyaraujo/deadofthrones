require 'logging'

Logging.color_scheme( 'bright',
  :levels => {
  :info  => :green,
  :warn  => :yellow,
  :error => :red,
  :fatal => [:white, :on_red]
},
  :date => :blue,
  :logger => :cyan,
  :message => :magenta
)

Logging.appenders.stdout(
  'stdout',
  :layout => Logging.layouts.pattern(
    :pattern => '[%d] %-5l %c: %m\n',
    :color_scheme => 'bright'
  )
)

@logger = Logging.logger['Dead of Thrones']
@logger.add_appenders 'stdout'
