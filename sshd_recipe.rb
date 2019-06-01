template "sshd_config" do
  path   "/etc/ssh/sshd_config"
  source "templates/sshd_config"
  mode   "600"
end

# sshd_configに変更があったら再起動
service "sshd" do
  subscribes :restart, "template[sshd_config]"
end
