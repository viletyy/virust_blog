rake assets:precompile RAILS_ENV=production &&
bundle exec pumactl --state tmp/sockets/production.puma.state restart