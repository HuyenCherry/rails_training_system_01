date_format ='%Y-%m-%d'

json.id user_report.id
json.title user_report.title
json.start user_report.created_at.strftime(date_format)
json.end user_report.updated_at.strftime(date_format)

json.color user_report.content unless user_report.content.blank?

json.update_url user_report_path(user_report, method: :patch)
json.edit_url edit_user_report_path(user_report)
