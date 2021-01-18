require 'test_helper'

<% module_namespacing do -%>
class Admin::<%= controller_class_name %>ControllerTest < ActionDispatch::IntegrationTest
  <%- if mountable_engine? -%>
  include Engine.routes.url_helpers

  <%- end -%>
  setup do
    @<%= singular_name %> = <%= plural_name %>(:one)
  end

  test "should get index" do
    get <%= index_helper %>_url
    assert_response :success
  end

  test "should get new" do
    get <%= new_helper %>
    assert_response :success
  end

  test "should create <%= singular_name %>" do
    assert_difference('<%= singular_name.camelize %>.count') do
      post <%= index_helper %>_url, params: { <%= "#{singular_name}: { #{attributes_names.collect{|name| "#{name}: @#{singular_name}.#{name}"}.join(', ')} }" %> }
    end

    assert_redirected_to <%= singular_table_name %>_url(<%= singular_name.camelize %>.last)
  end

  test "should show <%= singular_name %>" do
    get <%= singular_table_name %>_url(@<%= singular_name%>)
    assert_response :success
  end

  test "should get edit" do
    get edit_<%= singular_table_name %>_url(@<%= singular_name%>)
    assert_response :success
  end

  test "should update <%= singular_name %>" do
    patch <%= singular_table_name %>_url(@<%= singular_name%>), params: { <%= "#{singular_name}: { #{attributes_names.collect{|name| "#{name}: @#{singular_name}.#{name}"}.join(', ')} }" %> }
    assert_redirected_to <%= singular_table_name %>_url(<%= "@#{singular_name}" %>)
  end

  test "should destroy <%= singular_name %>" do
    assert_difference('<%= singular_name.camelize %>.count', -1) do
      delete <%= singular_table_name %>_url(@<%= singular_name%>)
    end

    assert_redirected_to <%= index_helper %>_url
  end
end
<% end -%>
