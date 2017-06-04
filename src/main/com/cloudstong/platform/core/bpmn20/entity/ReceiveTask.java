package com.cloudstong.platform.core.bpmn20.entity;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlType;
import javax.xml.namespace.QName;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name="tReceiveTask")
public class ReceiveTask extends Task
{

  @XmlAttribute
  protected String implementation;

  @XmlAttribute
  protected Boolean instantiate;

  @XmlAttribute
  protected QName messageRef;

  @XmlAttribute
  protected QName operationRef;

  public String getImplementation()
  {
    if (implementation == null) {
      return "##WebService";
    }
    return implementation;
  }

  public void setImplementation(String value)
  {
    implementation = value;
  }

  public boolean isInstantiate()
  {
    if (instantiate == null) {
      return false;
    }
    return instantiate.booleanValue();
  }

  public void setInstantiate(Boolean value)
  {
    instantiate = value;
  }

  public QName getMessageRef()
  {
    return messageRef;
  }

  public void setMessageRef(QName value)
  {
    messageRef = value;
  }

  public QName getOperationRef()
  {
    return operationRef;
  }

  public void setOperationRef(QName value)
  {
    operationRef = value;
  }
}