package com.finalprj.ILuvJeju.service.impl.crew;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalprj.ILuvJeju.domain.crew.CrewComment;
import com.finalprj.ILuvJeju.dto.crew.CrewCommentDTO;
import com.finalprj.ILuvJeju.repository.crew.CrewCommentRepository;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class CrewCommentServiceImpl {
    @Autowired
    CrewCommentRepository repository;

    @Autowired
    ModelMapper modelMapper;

    public List<CrewCommentDTO> getComments(Long postNo) {
        List<CrewComment> commentEntity = repository.findAllByCrewPost_PostNo(postNo);
        List<CrewCommentDTO> comments = modelMapper.map(commentEntity, new TypeToken<List<CrewCommentDTO>>() {
        }.getType());

        return comments;
    }

    @Transactional
    public CrewComment insertComment(CrewCommentDTO dto) {
        dto.setWDate(LocalDateTime.now());
        CrewComment comment = modelMapper.map(dto, CrewComment.class);
        //크루포인트 5증가
//        comment.getCrewPost().getCrew().setCrewPoint(comment.getCrewPost().getCrew().getCrewPoint()+5);
        return repository.save(comment);
    }

    @Transactional
    public void updateComment(Long commentNo, CrewCommentDTO dto){
        CrewComment comment = repository.findByCommentNo(commentNo);
        comment.setWDate(LocalDateTime.now());
        comment.setContent(dto.getContent());
    }

    public void deleteComment(Long commentNo) {
        repository.deleteById(commentNo);
    }

}
