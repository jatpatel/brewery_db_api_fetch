class Beer
  include ActiveModel::Serializers::JSON

  attr_accessor :id, :name, :name_display, :is_organic

  def initialize(beer_data)
    @errors = []
    @id, @name, @name_display, @is_organic = beer_data.values_at(
        'id', 'name', 'nameDisplay', 'isOrganic'
    )
    # make sure, we have valid model instance
    validate
  end

  def attributes
    {
     'id': nil, 'name': nil,
     'name_display': nil, 'is_organic': nil
    }
  end

  def is_organic
    if @is_organic == 'Y'
      true
    elsif @is_organic == 'N'
      false
    else
      nil
    end
  end

  def errors
    @errors
  end

  private


  def validate
    @errors << 'id required' unless @id.blank?
    @errors << 'name required' unless @name.blank?
  end
end