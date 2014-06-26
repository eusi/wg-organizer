module ApplicationHelper

	def resource_name
	   :user
	end

	def resource
	   @resource ||= User.new
	end

	def devise_mapping
	   @devise_mapping ||= Devise.mappings[:user]
	end

	#options_from_collection_for_select with an additional attribute
	def options_from_collection_for_select_with_attribute(collection, value, text, attr_name, attr_field)
	  new_collection = collection.map do |element|
	    [element.send(text), element.send(value), attr_name => element.send(attr_field)]
	  end

	  options_for_select(new_collection)
	end

end
