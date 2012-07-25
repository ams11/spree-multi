Spree::BaseController.class_eval do
  def authorized_store_member?
    if current_user.nil?
      flash[:error] = "You need to login to access the Merchant Panel."
      redirect_to login_path
    else
      if current_user.has_role?('admin')
        true
      else
        store_id = (params.has_key? :store_id) ? params[:store_id] : params[:id]
        store = Store.find(store_id)
        if store.nil? or store.users.find_by_id(current_user.id).nil?
          flash[:error] = "You are not authorized for this store."
          logger.info "**** MERCHANT PANEL FAILED AUTHORIZATION - user: #{current_user.email} - store: #{store_id}"
          redirect_back_or_default root_path
        else
          check_merchant_authorization
        end
      end
    end
  end

  def check_merchant_authorization
    authorize! :manage, self.class
  end

  def product_belongs_to_store?
    product = Product.find_by_permalink(params[:product_id])
    if product.nil?
      flash[:error] = "No such product in this store"
      redirect_back_or_default root_path
    else
      taxon = product.taxons.find_by_taxonomy_id(Taxonomy.find_by_name("Stores").id)
      if taxon.nil? || taxon.store.nil?
        flash[:error] = "No such product in this store"
        redirect_back_or_default root_path
      elsif taxon.store == Store.find(params[:store_id])
          true
      else
        flash[:error] = "No such product in this store"
        redirect_back_or_default root_path
      end
    end
  end
end