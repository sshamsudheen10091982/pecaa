class Product < ActiveRecord::Base
  has_many :product_images
  liquid_methods :created_at, :name
 
  has_many :order_products
  has_many :orders, :through => :order_products
  
  def add_image
    self.product_images.build if self.product_images.blank?
  end
  
end
