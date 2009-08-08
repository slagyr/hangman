module Refresh

  def mouse_clicked(e)
    scene = production.producer.open_scene('default_scene', production.theater['default'])
    production.theater.stages.each do |stage|
      if stage.current_scene
        production.producer.open_scene(stage.current_scene.name, stage)
      end
    end
  end

end