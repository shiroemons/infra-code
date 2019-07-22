include_recipe "rbenv::system"

file '/home/shiroemons/.bashrc' do
  action :edit
  block do |content|
    next if content.match %r{export RBENV_ROOT=/usr/local/rbenv}
    appendix = <<~EOS
      # rbenv
      export RBENV_ROOT=/usr/local/rbenv
      export PATH="${RBENV_ROOT}/bin:${PATH}"
      eval "$(rbenv init -)"
    EOS
    content << appendix
  end
end
