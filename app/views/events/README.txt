
One important code in show.html.haml is the following:

// outdoor - study - club
  // @traits is an instance variable created in the events controller
  // it is assigned to a model class of either outdoor, study, or club
  <%= render (:partial => @event.type, :locals => {:event => @traits}) %>         
        