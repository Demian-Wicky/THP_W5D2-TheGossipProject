class GossipsController < ApplicationController

  def index
    @gossips = Gossip.order('created_at DESC')
  end

  def show
    @gossip = Gossip.find(params[:id])
    @user = User.find_by(id: @gossip.user)
  end

  def new
    @gossip = Gossip.new
  end

  def create
    
    # puts "$" * 60
    # puts "ceci est le contenu de params :"
    # puts params
    # puts "$" * 60

    anonymous_user = User.find_by(first_name: "Anonymous")
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: anonymous_user)

    if @gossip.save
      flash[:notice] = 'Potin enregistré !'
      redirect_to root_path
    else

      flash.now[:notice] = @gossip.errors.full_messages#.to_sentence
      render 'new'
    end

  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end

end
