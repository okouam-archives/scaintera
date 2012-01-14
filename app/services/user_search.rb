class UserSearch

  def initialize(attributes)
    if attributes
      attributes.each do |k,v|
        self.instance_variable_set("@#{k}", v)
      end
    end
  end

  def execute(page, per_page)
    query = User.scoped
    query = query.where("email ilike ? OR login ilike ?", "%#{@name}%", "%#{@name}%") if @name.present?
    query = query.where("login ilike ?", "%#{@login}%") if @login.present?
    query = query.where("email ilike ?", "%#{@email}%") if @email.present?
    query = query.where("role ilike ?", "%#{@role}%") if @role.present?
    query = query.where("status ilike ?", "%#{@status}%") if @status.present?
    query = query.where("dob like ?", "%#{@dob}%") if @dob
    query.paginate(per_page: per_page, page: page)
  end

end