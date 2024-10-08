config.action_mailer.default_url_options = { host: ENV['REDMINE_HOST'], protocol: 'https' }
Rails.application.routes.default_url_options[:host] = ENV['REDMINE_HOST']