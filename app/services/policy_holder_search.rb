class PolicyHolderSearch

  def initialize(attributes)
    if attributes
      attributes.each do |k,v|
        self.instance_variable_set("@#{k}", v)
      end
    end
  end

  def execute(page, per_page)
    query = PolicyHolder.scoped
    query.where("first_name ilike ? OR last_name ilike ? or middle_names ilike ?", "%#{@name}%", "%#{@name}%", "%#{@name}%") if @name
    query.paginate(per_page: per_page, page: page)
  end

end