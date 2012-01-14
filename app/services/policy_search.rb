class PolicySearch

  def initialize(attributes)
    if attributes
      attributes.each do |k,v|
        self.instance_variable_set("@#{k}", v)
      end
    end
  end

  def execute(page, per_page)
    query = Policy.scoped
    query = query.joins([:user, :policy_holder])
    query = query.where("policies.id = ?", "#{@policy_number}") if @policy_number.present?
    query = query.where("users.login ilike ?", "%#{@agent}%") if @agent.present?
    query = query.where("category ilike ?", "#{@category}") if @category.present?
    query = query.where("policies.status like ?", "%#{@status}%") if @status.present?
    query = query.where("policies.created_at > ?", "%#{@added_after}%") if @added_after.present?
    query = query.where("policies.created_at < ?", "%#{@added_before}%") if @added_before.present?
    query = query.where("policy_holders.surname ilike ? ", "%#{@policy_holder_surname}%") if @policy_holder_surname.present?
    query.paginate(per_page: per_page, page: page)
  end

end