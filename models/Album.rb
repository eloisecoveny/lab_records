require_relative("../db/sql_runner")
class Album

  attr_accessor :name, :artist_id, :genre
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @genre = options["genre"]
    @artist_id = options["artist_id"]
  end

  def save()
    sql = "INSERT INTO albums (name, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE albums SET (name, genre, artist_id) = ($1, $2, $3) WHERE id = $4"
    values = [@name, @genre, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    album = SqlRunner.run(sql, values)[0]
    return Album.new(album)
  end

end
