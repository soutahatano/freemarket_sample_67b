crumb :root do
  link "Home", root_path
end

crumb :item do |item|
  link "#{item.name}", item_path(item)
  parent :root
end

crumb :user do |user|
  link "#{user.nickname}", user_path(user)
  parent :root
end

crumb :myuser do
  link "マイページ", user_path(current_user)
  parent :root
end

crumb :credit do
  link "支払い方法", credits_path
  parent :myuser
end

crumb :credit_create do
  link "カード情報入力", new_credit_path
  parent :myuser
end

crumb :credit_show do
  link "カード詳細", credit_path
  parent :myuser
end