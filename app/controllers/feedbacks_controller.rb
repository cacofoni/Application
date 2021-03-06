class FeedbacksController < ApplicationController
  layout false

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(ad_params)
    if @feedback.valid?
      Feedback.create! ad_params
    else
      @error_message = "Please enter your email and messages correctly"

      # Returns the whole form back. This is not the most effective
      # use of AJAX as we could return the error message in JSON, but
      # it makes easier the customization of the form with error messages
      # without worrying about the javascript.
      render :action => 'new', :status => :unprocessable_entity
    end
  end
  
  private
   def ad_params    
     params.require(:feedback).permit(:subject, :email, :comment)
   end
end
