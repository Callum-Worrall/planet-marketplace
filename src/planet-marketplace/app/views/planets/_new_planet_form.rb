<h1>Select or List a New Planet</h1>
<%= form_with(model: @planet, url: create_planet_path(@planet), local: true) do |form| %>
  <% if @planet.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@planet.errors.count, "error") %> prohibited this planet from being saved:</h2>

      <ul>
        <% @planet.errors.full_messages.each do |message| %>
          <li><%= message %></li>
        <% end %>
      </ul>
    </div>
  <% end %>

  <h6>* indicates fields required.</h6>

  <div class="field">
    <h5 type="label">Name*</h5>
    <%= form.text_field :name, required: true  %>
  </div>

  <div class="field">
    <h5 type="label">Description</h5>
    <%= form.text_field :description, required: true  %>
  </div>
  
  <div>
    <h5 type="label">Upload a Picture</h5>
    <%= form.label :picture %> <%= form.file_field :picture, accept: 'image/png,image/gif,image/jpeg,image/jpg' %>
  </div>

  <div class="actions">
    <%= form.submit %>
  </div>
<% end %>