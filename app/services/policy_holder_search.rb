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
    query = query.where("first_name ilike ? OR last_name ilike ? or middle_names ilike ?", "%#{@name}%", "%#{@name}%", "%#{@name}%") if @name
    query = query.where("first_name ilike ?", "%#{@first_name}%") if @first_name.present?
    query = query.where("last_name ilike ?", "%#{@last_name}%") if @last_name.present?
    query = query.where("dob like ?", "%#{@dob}%") if @dob
    if @postcode
      query = query.joins(:address).where("addresses.postcode ilike ?", "%#{@postcode}%")
    end
    query.paginate(per_page: per_page, page: page)
  end

end