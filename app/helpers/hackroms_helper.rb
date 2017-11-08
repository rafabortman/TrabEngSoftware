module HackromsHelper
    def get_hackrom(id)
        Hackrom.find_by("id = ?",id)
    end
end
