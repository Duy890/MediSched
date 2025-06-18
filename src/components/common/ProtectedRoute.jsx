"use client"

import { useAuth } from "../../context/AuthContext"

const ProtectedRoute = ({ children, requiredRole }) => {
  const { user, loading } = useAuth()

  if (loading) {
    return <div>Loading...</div>
  }

  if (!user) {
    return <div>Please log in to access this page.</div>
  }

  if (requiredRole && user.role !== requiredRole) {
    return <div>You don't have permission to access this page.</div>
  }

  return children
}

export default ProtectedRoute
