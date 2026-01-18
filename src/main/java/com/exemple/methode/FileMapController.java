package com.exemple.methode;

import com.frame.annotation.Controller;
import com.frame.annotation.GetMapping;
import com.frame.annotation.PostMapping;
import com.frame.model.ModelView;
import java.util.Map;

@Controller
public class FileMapController {

    public FileMapController() {}

    @GetMapping("/filemap")
    public ModelView fileMapForm() {
        ModelView mv = new ModelView("/fileMapForm.jsp");
        return mv;
    }

    @PostMapping("/filemap")
    public ModelView uploadFileMap(Map<String, byte[]> files) {
        ModelView mv = new ModelView("/fileMapResult.jsp");
        
        if (files != null && !files.isEmpty()) {
            mv.addAttribute("success", true);
            mv.addAttribute("files", files);
            mv.addAttribute("count", files.size());
            
            // Calculer la taille totale
            long totalSize = 0;
            for (byte[] fileContent : files.values()) {
                if (fileContent != null) {
                    totalSize += fileContent.length;
                }
            }
            mv.addAttribute("totalSize", totalSize);
        } else {
            mv.addAttribute("success", false);
            mv.addAttribute("error", "Aucun fichier uploadé");
        }
        
        return mv;
    }
}
