/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.sem4.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import java.math.BigDecimal;
import java.util.Collection;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 *
 * @author July
 */
@Entity
@Table(name = "guides")
public class Guide {

  private static final long serialVersionUID = 1L;
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @NotNull
  @Column(name = "description")
  private String description;

  @NotNull
  @Column(name = "number_of_ratings")
  private int numberOfRatings;

  @NotNull
  @Column(name = "rating_average")
  private BigDecimal ratingAverage;

  @JoinColumn(name = "user_id", referencedColumnName = "id")
  @ManyToOne(optional = false)
  private User userId;

  @OneToMany(cascade = CascadeType.ALL, mappedBy = "guideId")
  private Collection<ReviewGuide> reviewGuideCollection;

  @OneToMany(mappedBy = "guideId")
  private Collection<Tour> tourCollection;

  public Guide() {
  }

  public Guide(Long id) {
    this.id = id;
  }

  public Guide(Long id, String description, int numberOfRatings, BigDecimal ratingAverage) {
    this.id = id;
    this.description = description;
    this.numberOfRatings = numberOfRatings;
    this.ratingAverage = ratingAverage;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public int getNumberOfRatings() {
    return numberOfRatings;
  }

  public void setNumberOfRatings(int numberOfRatings) {
    this.numberOfRatings = numberOfRatings;
  }

  public BigDecimal getRatingAverage() {
    return ratingAverage;
  }

  public void setRatingAverage(BigDecimal ratingAverage) {
    this.ratingAverage = ratingAverage;
  }

  @JsonBackReference
  public User getUserId() {
    return userId;
  }

  public void setUserId(User userId) {
    this.userId = userId;
  }

  @JsonManagedReference
  public Collection<ReviewGuide> getReviewGuideCollection() {
    return reviewGuideCollection;
  }

  public void setReviewGuideCollection(Collection<ReviewGuide> reviewGuideCollection) {
    this.reviewGuideCollection = reviewGuideCollection;
  }

  @JsonManagedReference
  public Collection<Tour> getTourCollection() {
    return tourCollection;
  }

  public void setTourCollection(Collection<Tour> tourCollection) {
    this.tourCollection = tourCollection;
  }

  @Override
  public int hashCode() {
    int hash = 0;
    hash += (id != null ? id.hashCode() : 0);
    return hash;
  }

  @Override
  public boolean equals(Object object) {
    // TODO: Warning - this method won't work in the case the id fields are not set
    if (!(object instanceof Guide)) {
      return false;
    }
    Guide other = (Guide) object;
    if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
      return false;
    }
    return true;
  }

  @Override
  public String toString() {
    return "model.Guide[ id=" + id + " ]";
  }

}
