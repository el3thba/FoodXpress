class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end
    def index
        @comments = Comment.all
    end
    def create

        @comment = Comment.new(params[:comment].permit(:name, :body, :image))

        if @comment.save

            redirect_to @comment
        else
            render 'new'
        end
    end


    def show
        @comment = Comment.find(params[:id])
    end



    def edit

        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])

        if @comment.update(params[:comment].permit(:name, :body, :image))

            redirect_to @comment
        else

            render 'edit'
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to comments_path
    end
    def current_order
     if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
     end
  end

    private
        def comment_params

            params.require(:comment).permit(:name, :body, :image)
        end


end
