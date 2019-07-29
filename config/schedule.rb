# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# logが書き込まれるファイルの設定
set :output, "log/scraping.log"

# 開発環境or本番環境の設定
set :environment, :development

# スクレイピング・DB保存処理
every :weekday, at: '6:00 am' do
  runner 'NewsweekScrapingJobJob.perform_later'
end