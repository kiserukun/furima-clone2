module CategorysHelper
  def set_category
    categorys = Category.where(id: 2..11)
  end
end
