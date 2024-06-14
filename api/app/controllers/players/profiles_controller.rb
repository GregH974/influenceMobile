module Players
  class ProfilesController < BaseController
    before_action :find_or_initialize_player

    def edit
      @genders = Gender.all
    end

    def update
      @genders = Gender.all
      if @player.update(player_params)
        flash[:success] = I18n.t('profile.update.success')
        redirect_to edit_players_profile_path
      else
        flash[:error] = @player.errors.full_messages.to_sentence
        render :edit
      end
    end

    private

      def find_or_initialize_player
        @player = Player.find_or_initialize_by(user_id: current_user.id)
      end

      def player_params
        params.require(:player).permit(:last_name, :first_name, :age, :gender_id)
      end
  end
end
