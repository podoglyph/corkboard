const SearchForm = React.createClass({
    handleSearch: function() {
    const query = document.getElementById('query').value
    const self = this;
    $.ajax({
      url: 'https://corkboard-micro.herokuapp.com/api/v1/records',
      data: { query: query },
      success: function(data) {
        self.props.handleSearch(data);
      },
      error: function(xhr, status, error) {
        alert('Search error: ', status, xhr, error);
      }
    });
  },
  render: function() {
    return(
            <div className="col-md-6 col-md-offset-3 form-group">
              <input onChange={this.handleSearch}
                    type="text"
                    className="form-control"
                    placeholder="What service do you need?"
                    id='query' />
            </div>
          )
  }
});