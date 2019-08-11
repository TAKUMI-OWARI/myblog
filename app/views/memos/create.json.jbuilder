json.id @memo.id
json.content @memo.content
json.date @memo.created_at.strftime("%Y/%m/%d")
json.time @memo.created_at.strftime("%H:%M")