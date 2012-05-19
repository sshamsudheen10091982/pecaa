class Order < ActiveRecord::Base
  has_many :order_notess
  
  has_one :shipping_detial
  
  has_one :billing
  
  has_many :histories ,:as => :entity
  
  has_many :order_products
  has_many :products, :through => :order_products
    
  after_save do |order|
    [ "order_id", "status", "customer_email", "pay_status", "ship_status"].each do |clm|
      order.histories.create(:created_by => User.first.id,:order_id => order.id,:changes_txt => "changed this #{clm} to #{order.send(clm)}") if order.send("#{clm}_changed?")
    end
  end
  
end
