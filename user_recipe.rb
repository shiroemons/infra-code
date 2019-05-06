require 'dotenv/load'

USER_NAME = "shiroemons"
SSH_KEY   = ENV['SSH_KEY']
WHEEL_GID = "10"

user USER_NAME do
  password ENV['PASSWORD']
end

user USER_NAME do
  gid WHEEL_GID
end

directory "/home/#{USER_NAME}/.ssh" do
  owner USER_NAME
  group USER_NAME
  mode  "700"
end

# 公開鍵でssh可能にする
file "/home/#{USER_NAME}/.ssh/authorized_keys" do
  content SSH_KEY
  owner USER_NAME
  group USER_NAME
  mode  "600"
end

template "/etc/sudoers" do
  source "templates/sudoers"
  mode   "440"
  owner  "root"
  group  "root"
end
