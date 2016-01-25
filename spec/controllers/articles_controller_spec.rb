require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ArticlesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Article. As you add validations to Article, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for :article
  }

  let(:new_valid_attributes) {
    attributes_for :article
  }

  let(:invalid_attributes) {
    attributes_for :article_invalid_request
  }

  let(:brand1) {
    create(:brand)
  }

  let(:new_valid_attributes_with_brand) {
    attributes_for :article, brand_id: brand1.id
  }

  let(:valid_attributes_with_brand) {
    attributes_for :article, brand_id: brand1.id
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ArticlesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "user not auth" do
    it "#new redirect to sign_in" do
      get :new
      expect(response).to redirect_to('/users/sign_in')
    end

    it "#edit redirect to sign_in" do
      get :edit, id:1
      expect(response).to redirect_to('/users/sign_in')
    end

    it "#new redirect to sign_in" do
      post :create, {:article => valid_attributes}
      expect(response).to redirect_to('/users/sign_in')
    end

    it "#update redirect to sign_in" do
      article = Article.create! valid_attributes
      put :update, {:id => article.to_param, :article => new_valid_attributes}
      expect(response).to redirect_to('/users/sign_in')
    end

    it "#new redirect to sign_in" do
      article = Article.create! valid_attributes
      delete :destroy, {:id => article.to_param}
      expect(response).to redirect_to('/users/sign_in')
    end
  end

  describe "user auth" do
    before :each do
      @user = create(:user)
      login_with @user
    end

    describe "GET #new" do
      it "assigns a new article as @article" do
        get :new, {}
        expect(assigns(:article)).to be_a_new(Article)
      end

      it "assigns @brands"do
        get :new, {}
        expect(assigns(:brands)).to eq([brand1])
      end
    end

    describe "GET #edit" do
      it "assigns the requested article as @article" do
        article = Article.create! valid_attributes
        get :edit, {:id => article.to_param}
        expect(assigns(:article)).to eq(article)
      end

      it "assigns @brands"do
        article = Article.create! valid_attributes_with_brand
        get :edit, {:id => article.to_param}
        expect(assigns(:brands)).to match_array(brand1)
        expect(assigns(:article).brand_id).to eq brand1.id
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Article" do
          expect {
            post :create, {:article => valid_attributes}
          }.to change(Article, :count).by(1)
        end

        it "assigns a newly created article as @article" do
          post :create, {:article => valid_attributes_with_brand}
          expect(assigns(:article)).to be_a(Article)
          expect(assigns(:article)).to be_persisted
          expect(assigns(:article).brand_id).to eq brand1.id
        end

        it "redirects to the created article" do
          post :create, {:article => valid_attributes}
          expect(response).to redirect_to(Article.last)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved article as @article" do
          post :create, {:article => invalid_attributes}
          expect(assigns(:article)).to be_a_new(Article)
        end

        it "re-renders the 'new' template" do
          post :create, {:article => invalid_attributes}
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }

        it "updates the requested article" do
          article = Article.create! valid_attributes
          updated_params = attributes_for(:article).merge({id: 1, brand_id: brand1.id})
          article.reference = updated_params[:reference]
          article.brand_id = updated_params[:brand_id]
          put :update, {:id => article.to_param, :article => updated_params}
          expect(assigns(:article)).to eq(article)
        end

        it "redirects to the article" do
          article = Article.create! valid_attributes
          put :update, {:id => article.to_param, :article => valid_attributes}
          expect(response).to redirect_to(article)
        end
      end

      context "with invalid params" do
        it "assigns the article as @article" do
          article = Article.create! valid_attributes
          put :update, {:id => article.to_param, :article => invalid_attributes}
          expect(assigns(:article)).to eq(article)
        end

        it "re-renders the 'edit' template" do
          article = Article.create! valid_attributes
          put :update, {:id => article.to_param, :article => invalid_attributes}
          expect(response).to redirect_to(edit_article_path(article))
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested article" do
        article = Article.create! valid_attributes
        expect {
          delete :destroy, {:id => article.to_param}
        }.to change(Article, :count).by(-1)
      end

      it "redirects to the articles list" do
        article = Article.create! valid_attributes
        delete :destroy, {:id => article.to_param}
        expect(response).to redirect_to(articles_url)
      end
    end
  end
end
