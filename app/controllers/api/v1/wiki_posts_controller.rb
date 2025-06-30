class Api::V1::WikiPostsController < ApplicationController
  require "csv"

  def index
    @wiki_posts = WikiPost.all
    render json: @wiki_posts
  end

  def show
    @wiki_post = WikiPost.find(params[:id])
    # render json: @wiki_post
    serialized = WikiPostSerializer.serialize(@wiki_post)
    render json: serialized
  end

  def create
    @wiki_post = WikiPost.new(wiki_post_params)
    if @wiki_post.save
      render json: @wiki_post, status: :created
    else
      render json: @wiki_post.errors, status: :unprocessable_entity
    end
  end

  def update
    @wiki_post = WikiPost.find(params[:id])
    if @wiki_post.update(wiki_post_params)
      render json: @wiki_post, status: :ok
    else
      render json: @wiki_post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @wiki_post = WikiPost.find(params[:id])
    @wiki_post.destroy
    head :no_content
  end

  def xml_index
    @wiki_posts = WikiPost.all
    render xml: @wiki_posts.to_xml
  end

  def csv_index
    @wiki_posts = WikiPost.all
    csv_data = CSV.generate do |csv|
      csv << [ "ID", "Title", "Description", "Author" ]
      @wiki_posts.each do |post|
        csv << [ post.id, post.title, post.description, post.author ]
      end
    end
    send_data csv_data, filename: "wiki_posts.csv", type: "text/csv"
  end
  private
  def wiki_post_params
    params.require(:wiki_post).permit(:title, :description, :author)
  end
end
