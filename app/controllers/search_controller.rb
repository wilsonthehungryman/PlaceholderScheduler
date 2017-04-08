#
class SearchController < ApplicationController
  def search
    @raw_query = params[:query]
    @query = "%#{@raw_query}%"
    @sport = Sport.where('name like ?', @query)
    @refs = User.where('name like ? or email like ?', @query, @query)
    @associations = OfficialAssociation.where('name like ? or acronym like ?',
                                              @query, @query)

    # @refs << User.where(official_association: @associations)
  end
end
