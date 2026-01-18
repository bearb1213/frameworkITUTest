package com.exemple.methode;

import com.frame.annotation.Controller;
import com.frame.annotation.GetMapping;
import com.frame.annotation.PostMapping;
import com.frame.extension.FileExtension;
import com.frame.model.ModelView;
import java.util.Map;

@Controller
public class FileExtensionMapController {

    public FileExtensionMapController() {}

    @GetMapping("/fileextmap")
    public ModelView fileExtMapForm() {
        ModelView mv = new ModelView("/fileExtMapForm.jsp");
        return mv;
    }

    @PostMapping("/fileextmap")
    public ModelView uploadFileExtMap(Map<FileExtension, byte[]> files) {
        ModelView mv = new ModelView("/fileExtMapResult.jsp");
        
        if (files != null && !files.isEmpty()) {
            mv.addAttribute("success", true);
            mv.addAttribute("files", files);
            mv.addAttribute("count", files.size());
            
            // Calculer la taille totale et afficher les informations
            long totalSize = 0;
            StringBuilder filesInfo = new StringBuilder();
            
            for (Map.Entry<FileExtension, byte[]> entry : files.entrySet()) {
                FileExtension fileExt = entry.getKey();
                byte[] fileContent = entry.getValue();
                
                if (fileContent != null) {
                    totalSize += fileContent.length;
                    filesInfo.append(String.format("Fichier: %s | Extension: %s | Taille: %d bytes\n", 
                        fileExt.getFileName(), 
                        fileExt.getFileExtension(), 
                        fileContent.length));
                }
            }
            
            mv.addAttribute("totalSize", totalSize);
            mv.addAttribute("filesInfo", filesInfo.toString());
        } else {
            mv.addAttribute("success", false);
            mv.addAttribute("error", "Aucun fichier uploadé");
        }
        
        return mv;
    }
}
