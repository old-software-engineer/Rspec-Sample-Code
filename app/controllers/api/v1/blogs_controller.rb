# frozen_string_literal: true

# Api Controller
module Api
  module V1
    # Blogs Api Controller
    class BlogsController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :set_blog, only: %i[show edit update destroy]

      # GET /blogs or /blogs.json
      def index
        @blogs = Blog.all
        render json: @blogs
      end

      # GET /blogs/1 or /blogs/1.json
      def show
        if @blog
          render json: { blog: @blog }, status: :ok
        else
          render json: { error: @blog.errors }, status: :internal_server_error
        end
      end

      # GET /blogs/new
      def new
        @blog = Blog.new
      end

      # GET /blogs/1/edit
      def edit; end

      # POST /blogs or /blogs.json
      def create
        @blog = Blog.new(blog_params)

        if @blog.save
          render json: { blog: @blog }, status: :ok
        else
          render json: { error: @blog.errors }, status: :internal_server_error
        end
      end

      # PATCH/PUT /blogs/1 or /blogs/1.json
      def update
        if @blog.update(blog_params)
          render json: { blog: @blog }, status: :ok
        else
          render json: { error: @blog.errors }, status: :internal_server_error
        end
      end

      # DELETE /blogs/1 or /blogs/1.json
      def destroy
        @blog.destroy
        render json: { notice: 'Blog was successfully removed.' }, status: :ok
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_blog
        @blog = Blog.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        render json: { error: e.to_s }, status: :not_found
      end

      # Only allow a list of trusted parameters through.
      def blog_params
        params.permit(:title, :body, :imgurl)
      end
    end
  end
end
