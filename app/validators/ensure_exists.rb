# the object has to persist
class EnsureExists < ActiveModel::Validator
  def validate(record)
    type = options[:type]
    attribute_id = record[options[:attribute_id]]
    look_for(record, type, attribute_id)
  end

  private
  def look_for(record, type, attribute_id)
    attribute_class = type.to_s.capitalize.constantize
    attribute_object = attribute_class.find_by_id attribute_id
    record.errors[type] << 'must refere to existing object!' unless attribute_object
  end
end
