desc "Check that we can access everything"
task :check_write_permissions do
  on roles(:all) do |host|
    if test("[ -w #{fetch(:deploy_on)} ]")
      info "#{fetch(:deploy_on)} is writable on #{host}"
    else
      error "#{fetch(:deploy_on)} is not writable on #{host}"
    end
  end
end

