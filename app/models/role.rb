class Role
  def self.list
    OpenStruct.new({
      admin: 1,
      agent: 2,
      customer: nil
    })
  end
end