SimpleForm.setup do |config|
  config.wrappers :my_wrapper, :class => 'control-group',
    :hint_class => :field_with_hint, :error_class => :field_with_errors do |b|

    b.use :html5

    b.use :placeholder

    b.optional :maxlength

    b.optional :pattern

    b.optional :min_max

    b.optional :readonly

    ## Inputs
    b.use :label
    b.wrapper :my_wrapper, :tag => 'div', :class => 'controls' do |ba|
      ba.use :input
      ba.use :error, :wrap_with => { :tag => 'span', :class => 'label label-important' }
      ba.use :hint,  :wrap_with => { :tag => 'p', :class => 'help-block' }
    end
  end

  config.default_wrapper = :my_wrapper

  config.boolean_style = :nested

  config.button_class = 'btn'

  config.error_notification_tag = :div

  config.error_notification_class = 'alert alert-error'

  config.label_class = 'control-label'

  config.form_class = 'form-horizontal'

  config.generate_additional_classes_for = [:wrapper, :label, :input]
  config.browser_validations = true
end