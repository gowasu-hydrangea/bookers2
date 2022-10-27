class BooksController < ApplicationController
  
  # アクセス制限の実装＞他人の投稿編集画面に遷移できない
  before_action :correct_user, only: [:edit, :update]
  
  def new
    # controllerファイルの作成
    @book = Book.all
  end

  def index
    # bookのindexページの右側の作成(Books)
    @books = Book.all
  end

  def show
    
  end

  def edit
    # bookのeditページの作成
    @book = Book.find(params[:id])
    @book.delate
    redirect_to Book.index
  end
  
  def create
   @book = Book.new(book_params)
  # @book.user_id = current_user.id
   if @book.save
    # フラッシュメッセージの実装＞新規投稿が成功したとき
    flash[:notice] = "successfully"
    redirect_to book_path
   else
     flash[:alret] = "error"
     render :new
   end
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      # フラッシュメッセージの実装>投稿の更新が成功したとき
      flash[:notice] = "successfully"
     redirect_to book_path(book.id)
    else
     flash[:alret] = "error"
     render :new
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
    def correct_user
      @book = Book.find(params[:id])
      @user = @book.user
      redirect_to(books_path) unless @user == current_user
    end

end
