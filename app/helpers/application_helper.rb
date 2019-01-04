module ApplicationHelper


  def copyright_generator
    TranViewTool::Renderer.copyright('Peter Tran','All Rights Reserved')
  end
end
