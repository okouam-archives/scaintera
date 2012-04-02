class PolicyHolderSearch

  def initialize(attributes)
    if attributes
      attributes.each do |k,v|
        self.instance_variable_set("@#{k}", v)
      end
    end
  end

  def execute(page, per_page, user)
    query = PolicyHolder.scoped
    query = query.where("surname is not null")
    query = query.where("names ilike ? OR surname ilike ?", "%#{@name}%", "%#{@name}%") if @name.present?
    query = query.where("names ilike ?", "%#{@names}%") if @names.present?
    query = query.where("surname ilike ?", "%#{@surname}%") if @surname.present?
    query = query.where("postcode ilike ?", "%#{@postcode}%") if @postcode.present?
    query = query.where("dob = ?", "%#{@dob}%") if @dob.present?
    query = query.joins(:user).where("users.id = ?", user.id) if user.role == :agent
    query.paginate(per_page: per_page, page: page)
  end

end